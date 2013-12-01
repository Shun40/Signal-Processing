class ResultWriter
	# 定数の定義
	TEXT_FILE_NAME_1 = "./result/kadai2_SamplingData.txt";
	TEXT_FILE_NAME_2 = "./result/kadai2_QuantizationData.txt";
	TEXT_FILE_NAME_3 = "./result/kadai2_EncodingData.txt";
	CSV_FILE_NAME_1 = "./result/kadai2_SamplingData.csv";
	CSV_FILE_NAME_2 = "./result/kadai2_QuantizationData.csv";
	CSV_FILE_NAME_3 = "./result/kadai2_EncodingData.csv";
	OPEN_MODE = "w+:UTF-8";

	def initialize()
	end

	# 標本化データをファイル1へ書き込み
	def writeSamplingData(data)
		textFile = File.open(TEXT_FILE_NAME_1, OPEN_MODE);
		csvFile = File.open(CSV_FILE_NAME_1, OPEN_MODE);
		for t in 0..data.length - 1 do
			textLine = '[' + t.to_s() + ']' + "\t" + data[t].to_s() + "\n";
			csvLine = '[' + t.to_s() + ']' + ',' + data[t].to_s() + "\n";
			textFile.write(textLine);
			csvFile.write(csvLine);
		end
		textFile.close();
		csvFile.close();
		puts "Sampling Data (.txt) >> " + TEXT_FILE_NAME_1;
		puts "Sampling Data (.csv) >> " + CSV_FILE_NAME_1;
	end
	# 量子化データをファイル2へ書き込み
	def writeQuantizationData(data)
		textFile = File.open(TEXT_FILE_NAME_2, OPEN_MODE);
		csvFile = File.open(CSV_FILE_NAME_2, OPEN_MODE);
		for t in 0..data.length - 1 do
			textLine = '[' + t.to_s() + ']' + "\t" + data[t].to_s() + "\n";
			csvLine = '[' + t.to_s() + ']' + ',' + data[t].to_s() + "\n";
			textFile.write(textLine);
			csvFile.write(csvLine);
		end
		textFile.close();
		csvFile.close();
		puts "Quantization Data (.txt) >> " + TEXT_FILE_NAME_2;
		puts "Quantization Data (.csv) >> " + CSV_FILE_NAME_2;
	end
	# 符号化データをファイル3へ書き込み
	def writeEncodingData(data)
		textFile = File.open(TEXT_FILE_NAME_3, OPEN_MODE);
		csvFile = File.open(CSV_FILE_NAME_3, OPEN_MODE);
		for t in 0..data.length - 1 do
			textLine = '[' + t.to_s() + ']' + "\t" + data[t] + "\n";
			csvLine = '[' + t.to_s() + ']' + ',' + data[t] + "\n";
			textFile.write(textLine);
			csvFile.write(csvLine);
		end
		textFile.close();
		csvFile.close();
		puts "Encoding Data (.txt) >> " + TEXT_FILE_NAME_3;
		puts "Encoding Data (.csv) >> " + CSV_FILE_NAME_3;
	end
end