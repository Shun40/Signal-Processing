class FilteredSamplingDevice
	# 定数の定義
	TXT_FILE_NAME = "F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ResultFiles/FilterOn/SamplingData.txt"; # .txt形式の出力ファイルパス
	CSV_FILE_NAME = "F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ResultFiles/FilterOn/SamplingData.csv"; # .csv形式の出力ファイルパス
	OPEN_MODE = "w+:UTF-8";
	# 必要なモジュールの読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/CalcModule.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ADConverter/ADConverterCalcModule.rb';
	include CalcModule;
	include ADConverterCalcModule;

	# コンストラクタ
	def initialize(sCount, mvPoint)
		@fsData = Array.new(); # 平滑化処理済み標本化データ
		@sCount = sCount; # サンプリング回数
		@mvPoint = mvPoint; # 移動点数
	end

	# 平滑化処理付き標本化
	def filteredSampling(sData)
		start = @mvPoint;
		fin = @sCount - @mvPoint - 1;
		# 左側平滑化範囲外のデータ取得
		for t in 0..start - 1 do
			@fsData[t] = sData[t];
		end
		# 右側平滑化範囲外のデータ取得
		for t in fin..@sCount - 1 do
			@fsData[t] = sData[t];
		end
		# 平滑化範囲内のデータ取得
		for t in start..fin - 1 do
			data = 0.0;
			for i in (t - @mvPoint)..(t + @mvPoint) do
				data += sData[i];
			end
			data /= (@mvPoint * 2 + 1);
			@fsData[t] = roundDecimalPoint(data, 3);
		end
	end

	# 標本化結果の出力
	def writeData()
		txtFile = File.open(TXT_FILE_NAME, OPEN_MODE);
		csvFile = File.open(CSV_FILE_NAME, OPEN_MODE);
		for t in 0..@fsData.length - 1 do
			txtLine = '[' + t.to_s() + ']' + "\t" + @fsData[t].to_s() + "\n";
			csvLine = '[' + t.to_s() + ']' + ',' + @fsData[t].to_s() + "\n";
			txtFile.write(txtLine);
			csvFile.write(csvLine);
		end
		txtFile.close();
		csvFile.close();
	end

	# アクセスメソッド
	attr_reader :fsData;
end