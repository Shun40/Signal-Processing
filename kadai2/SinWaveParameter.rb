class SinWaveParameter
	# コンストラクタ
	def initialize(vMax, vMin, vAmplitude, waveFrequency)
		@vMax = vMax; # 電圧最大値[V]
		@vMin = vMin; # 電圧最小値[V]
		@vAmplitude = vAmplitude; # 振幅[V]
		@waveFrequency = waveFrequency; # 周波数[Hz]
	end

	# sin波のパラメータを表示
	def displaySinWaveParameter()
		puts "### Sin Wave Parameter ###";
		puts "V Max : " + @vMax.to_s() + "[V]";
		puts "V Min : " + @vMin.to_s() + "[V]";
		puts "V Amplitude : " + @vAmplitude.to_s() + "[V]";
		puts "Wave Frequency : " + @waveFrequency.to_s() + "[Hz]";
		puts "\n";
	end

	# アクセスメソッド
	attr_reader :vMax;
	attr_reader :vMin;
	attr_reader :vAmplitude;
	attr_reader :waveFrequency;
end