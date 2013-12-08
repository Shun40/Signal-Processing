class FunctionGeneratorDisplay
	# コンストラクタ
	def initialize(functionGenerator)
		@functionGenerator = functionGenerator; # 自分の親(ファンクションジェネレータ本体)
	end

	# sin波のパラメータの表示
	def displaySinWaveParameter()
		puts "<INPUT> Sin Wave Parameter <PARAM>";
		puts "V Max" + "\t\t\t" + @functionGenerator.sinWaveParameter.vMax.to_s() + "[V]";
		puts "V Min" + "\t\t\t" + @functionGenerator.sinWaveParameter.vMin.to_s() + "[V]";
		puts "V Amplitude" + "\t\t" + @functionGenerator.sinWaveParameter.vAmplitude.to_s() + "[V]";
		puts "Wave Frequency" + "\t\t" + @functionGenerator.sinWaveParameter.waveFrequency.to_s() + "[Hz]";
		puts "\n";
	end

	# ホワイトノイズのパラメータの表示
	def displayWhiteNoiseParameter()
		puts "<INPUT> White Noise Parameter <PARAM>";
		puts "Noise Max" + "\t\t" + @functionGenerator.whiteNoiseParameter.noiseMax.to_s() + "[V]";
		puts "Noise Min" + "\t\t" + @functionGenerator.whiteNoiseParameter.noiseMin.to_s() + "[V]";
		puts "Noise Amplitude" + "\t\t" + @functionGenerator.whiteNoiseParameter.noiseAmplitude.to_s() + "[V]";
		puts "\n";
	end
end