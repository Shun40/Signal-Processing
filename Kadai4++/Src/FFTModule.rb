# 添付資料4(3) #

module FFTModule
	# モジュールの読み込み
	require "F:/5IKoukiMemory/SignalProcessing/Program/Kadai4++/Src/StopwatchModule.rb";
	require "F:/5IKoukiMemory/SignalProcessing/Program/Kadai4++/Src/MathModule.rb";

	# 高速フーリエ変換
	def fft(inData, outRealData, outImagData)
		start = StopwatchModule.start(); # 時間計測開始
		shuffling(inData);
		_fft(inData, outRealData, outImagData);
		fin = StopwatchModule.finish(); # 時間計測終了
		puts "[FFT] : " + StopwatchModule.displayTime(fin - start); # 実行時間表示
	end

	# 実際のFFTの計算
	def _fft(inData, outRealData, outImagData)
		n = inData.length;
		# 入力データを実部と虚部に分解
		inRealData = Array.new();
		inImagData = Array.new();
		for i in 0..n-1 do
			inRealData[i] = inData[i];
			inImagData[i] = 0.0;
		end
		# 入力データの個数の指数(2の何乗か)を調べる
		bit = 1;
		while n / (2 ** bit) != 1 do
			bit += 1;
		end
		# bit段構成
		for l in 1..bit do
			lp = 2 ** l;
			lp2 = lp / 2;
			dp = -Math::PI / lp2;
			p = 0;
			for j in 0..lp2-1 do
				_cos = Math.cos(p);
				_sin = Math.sin(p);
				p += dp;
				# バタフライ演算
				(j..n-1).step(lp) do |i|
					iw = i + lp2;
					wReal = inRealData[iw] * _cos - inImagData[iw] * _sin;
					wImag = inRealData[iw] * _sin + inImagData[iw] * _cos;
					inRealData[iw] = inRealData[i] - wReal;
					inImagData[iw] = inImagData[i] - wImag;
					inRealData[i] = inRealData[i] + wReal;
					inImagData[i] = inImagData[i] + wImag;
				end
			end
		end
		for i in 0..n-1 do
			outRealData[i] = inRealData[i] / n;
			outImagData[i] = inImagData[i] / n;
			outRealData[i] = outRealData[i].round(4);
			outImagData[i] = outImagData[i].round(4);
		end
	end

	# シャフリング
	def shuffling(inData)
		j = 0;
		n = inData.length;
		for i in 0..n-2 do
			if i < j then
				tmp = inData[i];
				inData[i] = inData[j];
				inData[j] = tmp;
			end
			n2 = n / 2;
			while j >= n2 do
				j -= n2;
				n2 = n2 / 2;
			end
			j += n2;
		end
	end

	# メソッド実行許可
	module_function :fft;
	module_function :_fft;
	module_function :shuffling;
end