if (PLANE_ICAO == "B738") then
    create_command("MobiFlight/B738/BankAngle10",
        "BankAngle10",
        "AdjustBankAngle(0)",
        "",
        "")
    create_command("MobiFlight/B738/BankAngle15",
        "BankAngle15",
        "AdjustBankAngle(1)",
        "",
        "")
    create_command("MobiFlight/B738/BankAngle20",
        "BankAngle20",
        "AdjustBankAngle(2)",
        "",
        "")
    create_command("MobiFlight/B738/BankAngle25",
        "BankAngle25",
        "AdjustBankAngle(3)",
        "",
        "")
    create_command("MobiFlight/B738/BankAngle30",
        "BankAngle30",
        "AdjustBankAngle(4)",
        "",
        "")

    dataref("actualPosition", "laminar/B738/autopilot/bank_angle_pos", "readonly")

    function AdjustBankAngle(desiredPosition)
        local difference = actualPosition - desiredPosition
        if difference == 0 then
            return
        end

        local command = difference < 0
            and 'laminar/B738/autopilot/bank_angle_up'
            or 'laminar/B738/autopilot/bank_angle_dn'

        local absDifference = math.abs(difference)

        for i = 1, absDifference do
            command_once(command)
        end
    end
end
