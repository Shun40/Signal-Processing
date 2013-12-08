class ADConverterDisplay
	# コンストラクタ
	def initialize(adConverter)
		@adConverter = adConverter; # 自分の親(A/Dコンバータ本体)
	end

	# サンプリングパラメータの表示
	def displaySamplingParameter
		puts "<INPUT> Sampling Parameter <PARAM>";
		puts "Sampling Frequency" + "\t" + @adConverter.samplingParameter.samplingFrequency.to_s() + "[Hz]";
		puts "Sampling Time" + "\t\t" + @adConverter.samplingParameter.samplingTime.to_s() + "[s]";
		puts "Sampling Cycle" + "\t\t" + @adConverter.samplingParameter.samplingCycle.to_s() + "[s]";
		puts "Quantization Bit" + "\t" + @adConverter.samplingParameter.quantizationBit.to_s() + "[bit]";
		puts "\n";
	end

	# 標本化結果の出力ファイルのパス表示
	def displaySamplingDataFile()
		puts "<OUTPUT> Sampling Data File <DATA>";
		puts ".txt >>" + "\t" + SamplingDevice::TXT_FILE_NAME;
		puts ".csv >>" + "\t" + SamplingDevice::CSV_FILE_NAME;
		puts "\n";
	end
	# 量子化結果の出力ファイルのパス表示
	def displayQuantizationDataFile()
		puts "<OUTPUT> Quantization Data File <DATA>";
		puts ".txt >>" + "\t" + QuantizationDevice::TXT_FILE_NAME;
		puts ".csv >>" + "\t" + QuantizationDevice::CSV_FILE_NAME;
		puts "\n";
	end
	# 符号化結果の出力ファイルのパス表示
	def displayEncodingDataFile()
		puts "<OUTPUT> Encoding Data File <DATA>";
		puts ".txt >>" + "\t" + EncodingDevice::TXT_FILE_NAME;
		puts ".csv >>" + "\t" + EncodingDevice::CSV_FILE_NAME;
		puts "\n";
	end
end