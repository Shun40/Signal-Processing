class SinWaveParameterReader
	# 必要なモジュールの読み込み
	require 'F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/CalcModule.rb';
	include CalcModule;
	# 定数の定義
	SINWAVE_FILE_NAME = "F:/5IKoukiMemory/SignalProcessing/Program/Kadai3/ParameterFiles/SinWaveParameter.txt";
	OPEN_MODE = "r";

	# コンストラクタ
	def initialize()
		@parameter = Array.new();
		readParameter();
	end

	# sin波のデータファイルからパラメータを読み込み
	def readParameter()
		file = File.open(SINWAVE_FILE_NAME, OPEN_MODE);
		file.each do |line|
			dataLine = line.split(":")[1];
			dataValue = dataLine.split("[")[0];
			dataType = dataLine.split("(")[1].split(")")[0];
			if dataType === 'i' then
				data = toInteger(dataValue);
			elsif dataType === 'f' then
				data = toFloat(dataValue);
			end
			@parameter.push(data);
		end
		file.close();
	end

	# アクセスメソッド
	attr_reader :parameter;
end