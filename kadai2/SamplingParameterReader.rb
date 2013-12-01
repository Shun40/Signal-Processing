class SamplingParameterReader
	# 必要なモジュールの読み込み
	require '../CalcModule'
	include CalcModule
	# 定数の定義
	SAMPLING_FILE_NAME = "./data/SamplingParameter.txt";
	OPEN_MODE = "r";

	# コンストラクタ
	def initialize()
		@samplingParameter = Array.new();
	end

	# サンプリングパラメータのデータファイルからパラメータを読み込み
	def readSamplingParameter()
		file = File.open(SAMPLING_FILE_NAME, OPEN_MODE);
		file.each do |line|
			data = toInteger(line.split(":")[1]);
			@samplingParameter.push(data);
		end
		file.close();
	end

	# アクセスメソッド
	attr_reader :samplingParameter;
end