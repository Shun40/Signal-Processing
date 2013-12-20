# 添付資料3(5) #

module InputModule
	# モジュールの読み込み
	require "F:/5IKoukiMemory/SignalProcessing/Program/Kadai3++/Src/MathModule.rb";
	# 入力ディレクトリパス
	DIR_PATH = "F:/5IKoukiMemory/SignalProcessing/Program/Kadai2++/OutputFiles/";

	# データをファイルから読み込む
	def readFile(fileName, sf)
		i = 0;
		file = File.open(fileName, "r");
		file.each do |line|
			dataValue = line.split(",")[1];
			if dataValue === "sampling" then
				next;
			end
			sf[i] = MathModule.toFloat(dataValue);
			i += 1;
		end
		file.close();
	end

	# ファイル名を標準入力から読み込んで返す
	def getFileName()
		print "Input file name ?" + "\n";
		print ">>";
		return DIR_PATH + gets().chomp() + ".csv";
	end

	module_function :readFile;
	module_function :getFileName;
end