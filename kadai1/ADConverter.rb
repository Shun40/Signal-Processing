class ADConverter
	# 必要なモジュールの読み込み
	require '../CalcModule'
	include CalcModule

	# コンストラクタ
	def initialize()
		@samplingData = Array.new(); # 標本化データ
		@quantizationData = Array.new(); # 量子化データ
		@encodingData = Array.new(); # 符号化データ
	end

	# 標本化
	def sampling(vMax, waveFrequency, samplingTime, samplingCycle)
		n = calcSamplingCount(samplingTime, samplingCycle);
		for t in 0..n-1 do
			omega = calcCircularFrequency(waveFrequency);
			time = calcTime(t, samplingCycle);
			data = vMax * Math.sin(omega * time);
			@samplingData[t] = roundDecimalPoint(data, 3);
		end
	end

	# 量子化
	def quantize(vMin, vAmplitude, samplingTime, samplingCycle, quantizationBit)
		n = calcSamplingCount(samplingTime, samplingCycle);
		w = calcQuantizationWidth(vAmplitude, quantizationBit);
		p = calcPower(2, quantizationBit);
		qDataMin = -(p / 2);
		qDataMax = (p / 2) - 1;
		for t in 0..n-1 do
			qData = qDataMin;
			for wc in 0..p-1 do
				v1 = roundDecimalPoint(vMin + w * wc, 3);
				v2 = roundDecimalPoint(v1 + w, 3);
				if isDataInRange(@samplingData[t], v1, v2) then
					@quantizationData[t] = qData;
					break;
				elsif isQuantizeMax(qData, qDataMax) then
					@quantizationData[t] = qData;
					break;
				end
				qData += 1;
			end
		end
	end
	# 標本化データが2つの数値の範囲内にあるかチェック
	def isDataInRange(sData, qData1, qData2)
		if qData1 <= sData && sData < qData2 then
			return true;
		else
			return false;
		end
	end
	# 量子化上限値のチェック
	def isQuantizeMax(qData, qDataMax)
		if qData === qDataMax then
			return true;
		else
			return false;
		end
	end

	# 符号化
	def encoding(samplingTime, samplingCycle)
		n = calcSamplingCount(samplingTime, samplingCycle);
		for t in 0..n-1 do
			@encodingData[t] = toBinary(@quantizationData[t], 8);
		end
	end

	# アクセスメソッド
	attr_reader :samplingData;
	attr_reader :quantizationData;
	attr_reader :encodingData;
end