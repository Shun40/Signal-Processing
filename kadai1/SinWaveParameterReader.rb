class SinWaveParameterReader
	# 必要なモジュールの読み込み
	require '../CalcModule'
	include CalcModule
	# 定数の定義
	SINWAVE_FILE_NAME = "./data/SinWaveParameter.txt";
	OPEN_MODE = "r";

	# コンストラクタ
	def initialize()
		@sinWaveParameter = Array.new();
	end

	# sin波のデータファイルからパラメータを読み込み
	def readSinWaveParameter()
		file = File.open(SINWAVE_FILE_NAME, OPEN_MODE);
		file.each do |line|
			data = toInteger(line.split(":")[1]);
			@sinWaveParameter.push(data);
		end
		file.close();
	end

	# アクセスメソッド
	attr_reader :sinWaveParameter;
end