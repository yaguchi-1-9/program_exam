import datetime
import random
import time

# タイムアウトの確率(%)
probability = 50 

# 作成するLOG件数
log_num = 10 

for i in range(0, log_num, 1):
	# 1秒毎に作成
	time.sleep(1)
	
	# 現在時刻取得
	dt_now = datetime.datetime.now()

	log  = dt_now.strftime('%Y%m%d%H%M%S')
	log += ','
	log += '192.168.1.'
	log += str(random.randint(1,5))
	log += '/24,'
	
	if (random.randint(1,100) <= probability):
		log += '-'
	else:
		log += str(random.randint(1,100))

	print(log)
