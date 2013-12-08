class FilteredQuantizationDevice
	# 定数の定義
	TXT_FILE_NAME = "F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ResultFiles/FilterOn/QuantizationData.txt"; # .txt形式の出力ファイルパス
	CSV_FILE_NAME = "F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ResultFiles/FilterOn/QuantizationData.csv"; # .csv形式の出力ファイルパス
	OPEN_MODE = "w+:UTF-8";
	# 必要なモジュールの読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/CalcModule.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ADConverter/ADConverterCalcModule.rb';
	include CalcModule;
	include ADConverterCalcModule;

	# コンストラクタ
	def initialize(vMin, vMax, sCount, w, e)
		@fqData = Array.new(); # 平滑化処理済み量子化データ
		@vMin = vMin; # 電圧最小値
		@vMax = vMax; # 電圧最大値
		@sCount = sCount; # サンプリング回数
		@w = w; # 量子化幅
		@e = e; # 累乗数(2^bit)
	end

	# 平滑化処理付き量子化
	def filteredQuantize(fsData)
		qMin = -(@e / 2);
		qMax = (@e / 2) - 1;
		for t in 0..@sCount - 1 do
			q = qMin;
			for wc in 0..@e - 1 do
				v1 = roundDecimalPoint(@vMin + @w * wc, 3);
				v2 = roundDecimalPoint(v1 + @w, 3);
				if isNumberInRange(fsData[t], v1, v2) then
					@fqData[t] = q;
					break;
				elsif isNumberMax(fsData[t], @vMax - @w) then
					@fqData[t] = qMax;
					break;
				elsif isNumberMin(fsData[t], @vMin) then
					@fqData[t] = qMin;
					break;
				end
				q += 1;
			end
		end
	end

	# 量子化結果の出力
	def writeData()
		txtFile = File.open(TXT_FILE_NAME, OPEN_MODE);
		csvFile = File.open(CSV_FILE_NAME, OPEN_MODE);
		for t in 0..@fqData.length - 1 do
			txtLine = '[' + t.to_s() + ']' + "\t" + @fqData[t].to_s() + "\n";
			csvLine = '[' + t.to_s() + ']' + ',' + @fqData[t].to_s() + "\n";
			txtFile.write(txtLine);
			csvFile.write(csvLine);
		end
		txtFile.close();
		csvFile.close();
	end

	# アクセスメソッド
	attr_reader :fqData;
end