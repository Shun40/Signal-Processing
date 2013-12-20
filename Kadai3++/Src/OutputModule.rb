# 添付資料3(6) #

module OutputModule
	# 出力ディレクトリパス
	DIR_PATH = "F:/5IKoukiMemory/SignalProcessing/Program/Kadai3++/OutputFiles/";

	# データをファイルへ出力
	def writeFile(fileName, sf, qf, ef, wnsf, n, tau)
		file = File.open(fileName, "w+");
		line = "time" + "," + "sampling" + "," + "quantize" + "," + "encode" + "," + "noise sampling" + "\n";
		file.write(line);
		for i in 0..n-1 do
			timeStr = (tau * i).to_s(); # 時刻
			sfStr = sf[i].to_s(); # 標本化データ
			qfStr = qf[i].to_s(); # 量子化データ
			efStr = ef[i].to_s(); # 符号化データ
			wnsfStr = wnsf[i].to_s(); # ノイズ付き標本化データ
			line = timeStr + "," + sfStr + "," + qfStr + "," + efStr + "," + wnsfStr + "\n";
			file.write(line);
		end
		file.close();
	end

	# ファイル名を標準入力から読み込んで返す
	def getFileName()
		print "Output file name ?" + "\n";
		print ">>";
		return DIR_PATH + gets().chomp() + ".csv";
	end

	module_function :writeFile;
	module_function :getFileName;
end