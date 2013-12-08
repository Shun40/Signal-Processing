class EncodingDevice
	# 定数の定義
	TXT_FILE_NAME = "F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ResultFiles/FilterOff/EncodingData.txt"; # .txt形式の出力ファイルパス
	CSV_FILE_NAME = "F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ResultFiles/FilterOff/EncodingData.csv"; # .csv形式の出力ファイルパス
	OPEN_MODE = "w+:UTF-8";
	# 必要なモジュールの読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/CalcModule.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ADConverter/ADConverterCalcModule.rb';
	include CalcModule;
	include ADConverterCalcModule;

	# コンストラクタ
	def initialize(sCount, qBit)
		@eData = Array.new(); # 符号化データ
		@sCount = sCount; # サンプリング回数
		@qBit = qBit; # 量子化ビット数
	end

	# 符号化
	def encoding(qData)
		for t in 0..@sCount - 1 do
			@eData[t] = toBinary(qData[t], @qBit);
		end
	end

	# 標本化結果の出力
	def writeData()
		txtFile = File.open(TXT_FILE_NAME, OPEN_MODE);
		csvFile = File.open(CSV_FILE_NAME, OPEN_MODE);
		for t in 0..@eData.length - 1 do
			txtLine = '[' + t.to_s() + ']' + "\t" + @eData[t].to_s() + "\n";
			csvLine = '[' + t.to_s() + ']' + ',' + @eData[t].to_s() + "\n";
			txtFile.write(txtLine);
			csvFile.write(csvLine);
		end
		txtFile.close();
		csvFile.close();
	end

	# アクセスメソッド
	attr_reader :eData;
end