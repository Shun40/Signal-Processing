# 添付資料4(4) #

module StopwatchModule
	# 計測開始
	def start()
		return Time.now();
	end
	# 計測終了
	def finish()
		return Time.now();
	end
	# 計測時間表示
	def displayTime(time)
		return time.to_s() + "[sec]";
	end

	module_function :start;
	module_function :finish;
	module_function :displayTime;
end