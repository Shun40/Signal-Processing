class QuantizationDevice
	# 定数の定義
	TXT_FILE_NAME = "F:/5IKoukiMemory/SignalProcessing/Program/Kadai1/ResultFiles/QuantizationData.txt"; # .txt形式の出力ファイルパス
	CSV_FILE_NAME = "F:/5IKoukiMemory/SignalProcessing/Program/Kadai1/ResultFiles/QuantizationData.csv"; # .csv形式の出力ファイルパス
	OPEN_MODE = "w+:UTF-8";
	# 必要なモジュールの読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai1/CalcModule.rb';
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai1/ADConverter/ADConverterCalcModule.rb';
	include CalcModule;
	include ADConverterCalcModule;

	# コンストラクタ
	def initialize(vMin, vMax, sCount, w, e)
		@qData = Array.new(); # 量子化データ
		@vMin = vMin; # 電圧最小値
		@vMax = vMax; # 電圧最大値
		@sCount = sCount; # サンプリング回数
		@w = w; # 量子化幅
		@e = e; # 累乗数(2^bit)
	end

	# 量子化
	def quantize(sData)
		qMin = -(@e / 2);
		qMax = (@e / 2) - 1;
		for t in 0..@sCount - 1 do
			q = qMin;
			for wc in 0..@e - 1 do
				v1 = roundDecimalPoint(@vMin + @w * wc, 3);
				v2 = roundDecimalPoint(v1 + @w, 3);
				if isNumberInRange(sData[t], v1, v2) then
					@qData[t] = q;
					break;
				elsif isNumberMax(sData[t], @vMax - @w) then
					@qData[t] = qMax;
					break;
				elsif isNumberMin(sData[t], @vMin) then
					@qData[t] = qMin;
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
		for t in 0..@qData.length - 1 do
			txtLine = '[' + t.to_s() + ']' + "\t" + @qData[t].to_s() + "\n";
			csvLine = '[' + t.to_s() + ']' + ',' + @qData[t].to_s() + "\n";
			txtFile.write(txtLine);
			csvFile.write(csvLine);
		end
		txtFile.close();
		csvFile.close();
	end

	# アクセスメソッド
	attr_reader :qData;
end