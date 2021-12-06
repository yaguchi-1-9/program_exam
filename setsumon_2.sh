#!/bin/bash

echo " --------------------------------------------------------"
echo " N回以上連続してタイムアウトした場合に故障とみなしますか?"

# パラメータの入力チェック
function ConfirmParameter() {
	echo -n " 数値を入力して下さい: "
	read N

	# 数値判定
	expr "${N}" + 1 >&/dev/null
	if [ ! $? -lt 2 ] ; then
		ConfirmParameter
	fi
}

ConfirmParameter

# ログをリアルタイムで監視
tail -f +1 log/test.log | \
# ログを1行ずつ処理
gawk -v N=$N \
	 'BEGIN{
		# 区切り文字を設定
	 	FS=",";

        # $1：ログの時刻
		# $2：サーバアドレス
		# $3：応答時間(ms) (ただし、故障時は"-")
	 } 
	 {
		# ログの時刻を分割
		year   = substr( $1, 1, 4)
		month  = substr( $1, 5, 2)
		day    = substr( $1, 7, 2)
		hour   = substr( $1, 9, 2)
		minute = substr( $1,11, 2)
		second = substr( $1,13, 2)

		# ログの時刻を整形、Unix時間へ変換（故障期間の計算の為）
		log_date = year" "month" "day" "hour" "minute" "second
        log_time = mktime(log_date)
		
		# タイムアウトした時
		if($3=="-"){
			# タイムアウトをカウント
			disorder_cout[$2] += 1;

			# 最初にタイムアウトした時刻を記録
			if (disorder_cout[$2] == 1){
				disorder_time[$2] = log_time;
			}

			# 故障がN回以上連続した時
			if(disorder_cout[$2]>=N){

				# 故障期間の計算
				fail_hour   = int((log_time-disorder_time[$2])/60/60);
				fail_minute = int((log_time-disorder_time[$2])/60-fail_hour*60);
				fail_second = int((log_time-disorder_time[$2])%60);
				fail_time = fail_hour" hours "fail_minute" minutes "fail_second" seconds"

				# 故障したサーバアドレスを出力
				printf "[Failure]  ServerAddress: %s, ", $2;

				# 故障時刻を出力
				printf "Date: %s, ",strftime("%Y/%m/%d %H:%M:%S",log_time);

				# 故障期間を出力
				printf "FailureTime: %s, ",fail_time;

				# 連続タイムアウト回数を出力
				printf "Sequence: %d\n", disorder_cout[$2];
			}

		# 故障から復活した時
	 	} else if(disorder_cout[$2]>=N) {

			# 故障期間の計算
			fail_hour   = int((log_time-disorder_time[$2])/60/60);
			fail_minute = int((log_time-disorder_time[$2])/60-fail_hour*60);
			fail_second = int((log_time-disorder_time[$2])%60);
			fail_time = fail_hour" hours "fail_minute" minutes "fail_second" seconds "

			# 回復したサーバアドレス、故障期間を出力
			printf "[Recovery] ServerAddress: %s, ",$2;
			printf "Date: %s, ",strftime("%Y/%m/%d %H:%M:%S",log_time);
			printf "FailureTime: %s\n",fail_time;

		    # フラグを回復済に変更
			disorder_time[$2] = 0;
			disorder_cout[$2] = 0;

		# N回未満のタイムアップから復活した時
	 	} else {
		    # フラグを回復済に変更
			disorder_time[$2] = 0;
			disorder_cout[$2] = 0;
		}

	 }'
