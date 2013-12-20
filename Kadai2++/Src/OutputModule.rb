# 添付資料2(6) #

module OutputModule
	# 出力ディレクトリパス
	DIR_PATH = "F:/5IKoukiMemory/SignalProcessing/Program/Kadai2++/OutputFiles/";

	# データをファイルへ出力
	def writeFile(fileName, sf, qf, ef, wn, n, tau)
		file = File.open(fileName, "w+");
		line = "time" + "," + "sampling" + "," + "quantize" + "," + "encode" + "," + "noise" + "\n";
		file.write(line);
		for i in 0..n-1 do
			timeStr = (tau * i).to_s(); # 時刻
			sfStr = sf[i].to_s(); # 標本化データ
			qfStr = qf[i].to_s(); # 量子化データ
			efStr = ef[i].to_s(); # 符号化データ
			wnStr = wn[i].to_s(); # ホワイトノイズデータ
			line = timeStr + "," + sfStr + "," + qfStr + "," + efStr + "," + wnStr + "\n";
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