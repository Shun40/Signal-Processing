class SamplingDevice
	# 定数の定義
	TXT_FILE_NAME = "F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ResultFiles/FilterOff/SamplingData.txt"; # .txt形式の出力ファイルパス
	CSV_FILE_NAME = "F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ResultFiles/FilterOff/SamplingData.csv"; # .csv形式の出力ファイルパス
	OPEN_MODE = "w+:UTF-8";
	# 必要なモジュールの読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/CalcModule.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ADConverter/ADConverterCalcModule.rb';
	include CalcModule;
	include ADConverterCalcModule;

	# コンストラクタ
	def initialize(sCount, sCycle)
		@sData = Array.new(); # 標本化データ
		@sCount = sCount; # サンプリング回数
		@sCycle = sCycle; # サンプリング周期
	end

	# 標本化
	def sampling(fg)
		fg.displaySinWaveParameter();
		fg.displayWhiteNoiseParameter();
		for t in 0..@sCount - 1 do
			time = getTime(t, @sCycle);
			data = fg.generateSinWave(time); # sin波のデータ取得
			data += fg.generateWhiteNoise(); # ホワイトノイズ付与
			@sData[t] = roundDecimalPoint(data, 3);
		end
	end

	# 標本化結果の出力
	def writeData()
		txtFile = File.open(TXT_FILE_NAME, OPEN_MODE);
		csvFile = File.open(CSV_FILE_NAME, OPEN_MODE);
		for t in 0..@sData.length - 1 do
			txtLine = '[' + t.to_s() + ']' + "\t" + @sData[t].to_s() + "\n";
			csvLine = '[' + t.to_s() + ']' + ',' + @sData[t].to_s() + "\n";
			txtFile.write(txtLine);
			csvFile.write(csvLine);
		end
		txtFile.close();
		csvFile.close();
	end

	# アクセスメソッド
	attr_reader :sData;
end