# 添付資料4(2) #

module DFTModule
	# モジュールの読み込み
	require "F:/5IKoukiMemory/SignalProcessing/Program/Kadai4++/Src/StopwatchModule.rb";
	require "F:/5IKoukiMemory/SignalProcessing/Program/Kadai4++/Src/MathModule.rb";

	# 離散フーリエ変換
	def dft(inData, outRealData, outImagData)
		start = StopwatchModule.start(); # 時間計測開始
		_dft(inData, outRealData, outImagData);
		fin = StopwatchModule.finish(); # 時間計測終了
		puts "[DFT] : " + StopwatchModule.displayTime(fin - start); # 実行時間表示
	end

	# 実際のDFTの計算
	def _dft(inData, outRealData, outImagData)
		n = inData.length;
		for k in 0..n-1 do
			outRealData[k] = 0.0;
			outImagData[k] = 0.0;
			for i in 0..n-1 do
				phase = (2.0 * Math::PI * k * i) / n;
				outRealData[k] += inData[i] * Math.cos(phase); # 実部の計算
				outImagData[k] += inData[i] * Math.sin(phase); # 虚部の計算
			end
			outRealData[k] = outRealData[k] / n;
			outImagData[k] = outImagData[k] / -n;
			outRealData[k] = outRealData[k].round(4);
			outImagData[k] = outImagData[k].round(4);
		end
	end

	# メソッド実行許可
	module_function :dft;
	module_function :_dft;
end