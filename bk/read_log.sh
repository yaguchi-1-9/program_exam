#!/bin/bash

# ログをリアルタイムで監視
tail -f +1 log/test.log | \

# ログを1行ずつ処理
gawk 'BEGIN{
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
		
		# 故障した時
		if($3=="-"){
			disorder_time[$2] = log_time;

			# 故障したサーバアドレス、故障時刻を出力
			printf "[Failure] Server address: %s, Date: %s\n",$2,log_date;
	 	}

		# 故障済かつ回復した時
		if(disorder_time[$2]!=0 && $3!="-"){

			# 故障期間の計算
			fail_hour   = int((log_time-disorder_time[$2])/60/60);
			fail_minute = int((log_time-disorder_time[$2])/60-fail_hour*60);
			fail_second = int((log_time-disorder_time[$2])%60);
			fail_time = fail_hour" hours, "fail_minute" minutes, "fail_second" seconds "

			# 回復したサーバアドレス、故障期間を出力
			printf "[Recovery] Server address: %s, ",$2;
			printf "Failure Time: %s\n",fail_time;

		    # フラグを回復済に変更
			disorder_time[$2]=0;
		}
	 }'
