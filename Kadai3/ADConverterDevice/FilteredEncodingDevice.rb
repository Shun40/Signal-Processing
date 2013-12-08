class FilteredEncodingDevice
	# 定数の定義
	TXT_FILE_NAME = "F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ResultFiles/FilterOn/EncodingData.txt"; # .txt形式の出力ファイルパス
	CSV_FILE_NAME = "F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ResultFiles/FilterOn/EncodingData.csv"; # .csv形式の出力ファイルパス
	OPEN_MODE = "w+:UTF-8";
	# 必要なモジュールの読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/CalcModule.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ADConverter/ADConverterCalcModule.rb';
	include CalcModule;
	include ADConverterCalcModule;

	# コンストラクタ
	def initialize(sCount, qBit)
		@feData = Array.new(); # 平滑化処理済み符号化データ
		@sCount = sCount; # サンプリング回数
		@qBit = qBit; # 量子化ビット数
	end

	# 平滑化処理付き符号化
	def filteredEncoding(fqData)
		for t in 0..@sCount - 1 do
			@feData[t] = toBinary(fqData[t], @qBit);
		end
	end

	# 標本化結果の出力
	def writeData()
		txtFile = File.open(TXT_FILE_NAME, OPEN_MODE);
		csvFile = File.open(CSV_FILE_NAME, OPEN_MODE);
		for t in 0..@feData.length - 1 do
			txtLine = '[' + t.to_s() + ']' + "\t" + @feData[t].to_s() + "\n";
			csvLine = '[' + t.to_s() + ']' + ',' + @feData[t].to_s() + "\n";
			txtFile.write(txtLine);
			csvFile.write(csvLine);
		end
		txtFile.close();
		csvFile.close();
	end

	# アクセスメソッド
	attr_reader :feData;
end