module ADConverterCalcModule
	# 必要なモジュールの読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai2/CalcModule.rb';
	include CalcModule;

	# サンプリング回数の計算
	def getSamplingCount(samplingTime, samplingCycle)
		return toInteger(samplingTime / samplingCycle);
	end
	# 三角関数の時刻の計算
	def getTime(time, samplingCycle)
		return time * samplingCycle;
	end
	# 量子化幅の計算
	def getQuantizationWidth(amplitude, quantizationBit)
		exponentiation = getExponentiation(2, quantizationBit);
		quantizationWidth = amplitude / (exponentiation - 1);
		return roundDecimalPoint(quantizationWidth, 3);
	end
end