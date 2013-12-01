class SamplingParameter
	# コンストラクタ
	def initialize(samplingFrequency, samplingTime, quantizationBit)
		@samplingFrequency = samplingFrequency; # サンプリング周波数[Hz]
		@samplingTime = samplingTime; # サンプリング時間[sec]
		@samplingCycle = 1.0 / samplingFrequency; # サンプリング周期[sec]
		@quantizationBit = quantizationBit; # 量子化ビット数[bit]
	end

	# サンプリングのパラメータを表示
	def displaySamplingParameter()
		puts "### Sampling Parameter ###";
		puts "Sampling Frequency (fs) : " + @samplingFrequency.to_s() + "[Hz]";
		puts "Sampling Time : " + @samplingTime.to_s() + "[sec]";
		puts "Sampling Cycle (τ) : " + @samplingCycle.to_s() + "[sec]";
		puts "Quantization Bit : " + @quantizationBit.to_s() + "[bit]";
		puts "\n";
	end

	# アクセスメソッド
	attr_reader :samplingFrequency;
	attr_reader :samplingTime;
	attr_reader :samplingCycle;
	attr_reader :quantizationBit;
end