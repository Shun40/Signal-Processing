class WhiteNoiseParameter
	# コンストラクタ
	def initialize(noiseMax, noiseMin, noiseAmplitude)
		@noiseMax = noiseMax; # ノイズ最大値[V]
		@noiseMin = noiseMin; # ノイズ最小値[V]
		@noiseAmplitude = noiseAmplitude; # ノイズ振幅[V]
	end

	# ホワイトノイズのパラメータを表示
	def displayWhiteNoiseParameter()
		puts "### White Noise Parameter ###";
		puts "Noise Max : " + @noiseMax.to_s() + "[V]";
		puts "Noise Min : " + @noiseMin.to_s() + "[V]";
		puts "Noise Amplitude : " + @noiseAmplitude.to_s() + "[V]";
		puts "\n";
	end

	# アクセスメソッド
	attr_reader :noiseMax;
	attr_reader :noiseMin;
	attr_reader :noiseAmplitude;
end