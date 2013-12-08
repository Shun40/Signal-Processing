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

	# 移動平均パラメータの表示
	def displayMovingAverageParameter
		puts "<FILTER> Moving Average Parameter <PARAM>";
		puts "Moving Point" + "\t\t" + @adConverter.movingAverageParameter.movingPoint.to_s() + "[data]";
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
	# 平滑化処理付き標本化結果の出力ファイルのパス表示
	def displayFilteredSamplingDataFile()
		puts "<OUTPUT> Filtered Sampling Data File <DATA>";
		puts ".txt >>" + "\t" + FilteredSamplingDevice::TXT_FILE_NAME;
		puts ".csv >>" + "\t" + FilteredSamplingDevice::CSV_FILE_NAME;
		puts "\n";
	end
	# 平滑化処理付き量子化結果の出力ファイルのパス表示
	def displayFilteredQuantizationDataFile()
		puts "<OUTPUT> Filtered Quantization Data File <DATA>";
		puts ".txt >>" + "\t" + FilteredQuantizationDevice::TXT_FILE_NAME;
		puts ".csv >>" + "\t" + FilteredQuantizationDevice::CSV_FILE_NAME;
		puts "\n";
	end
	# 平滑化処理付き符号化結果の出力ファイルのパス表示
	def displayFilteredEncodingDataFile()
		puts "<OUTPUT> Filtered Encoding Data File <DATA>";
		puts ".txt >>" + "\t" + FilteredEncodingDevice::TXT_FILE_NAME;
		puts ".csv >>" + "\t" + FilteredEncodingDevice::CSV_FILE_NAME;
		puts "\n";
	end
end