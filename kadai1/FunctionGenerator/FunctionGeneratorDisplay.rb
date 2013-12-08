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
end