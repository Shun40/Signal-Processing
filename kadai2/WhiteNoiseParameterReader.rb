class WhiteNoiseParameterReader
	# 必要なモジュールの読み込み
	require '../CalcModule'
	include CalcModule
	# 定数の定義
	WHITENOISE_FILE_NAME = "./data/WhiteNoiseParameter.txt";
	OPEN_MODE = "r";

	# コンストラクタ
	def initialize()
		@whiteNoiseParameter = Array.new();
	end

	# ホワイトノイズパラメータのデータファイルからパラメータを読み込み
	def readWhiteNoiseParameter()
		file = File.open(WHITENOISE_FILE_NAME, OPEN_MODE);
		file.each do |line|
			data = toFloat(line.split(":")[1]);
			@whiteNoiseParameter.push(data);
		end
		file.close();
	end

	# アクセスメソッド
	attr_reader :whiteNoiseParameter;
end