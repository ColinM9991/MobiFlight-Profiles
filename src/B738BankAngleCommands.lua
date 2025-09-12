function AdjustBankAngle(actualPosition, desiredPosition, upCommand, downCommand)
    local difference = actualPosition - desiredPosition
    if difference == 0 then
        return
    end

    local command = difference < 0
        and upCommand
        or downCommand

    local absDifference = math.abs(difference)

    for _ = 1, absDifference do
        command_once(command)
    end
end

if (PLANE_ICAO == "B738") then
    dataref("actualPosition", "laminar/B738/autopilot/bank_angle_pos", "readonly")

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

    function Adjust738BankAngle(desiredPosition)
        AdjustBankAngle(actualPosition, desiredPosition, 'laminar/B738/autopilot/bank_angle_up', 'laminar/B738/autopilot/bank_angle_dn')
    end
end

if (PLANE_ICAO == "B772") then
    dataref("actualPosition", "1-sim/ckpt/mcpBankAngleSwitch/anim", "readonly")

    create_command("MobiFlight/B777/BankAngleAuto",
        "BankAngleAuto",
        "AdjustBankAngle(0)",
        "",
        "")
    create_command("MobiFlight/B777/BankAngle5",
        "BankAngle05",
        "AdjustBankAngle(1)",
        "",
        "")
    create_command("MobiFlight/B777/BankAngle10",
        "BankAngle10",
        "AdjustBankAngle(2)",
        "",
        "")
    create_command("MobiFlight/B777/BankAngle15",
        "BankAngle15",
        "AdjustBankAngle(3)",
        "",
        "")
    create_command("MobiFlight/B777/BankAngle20",
        "BankAngle20",
        "AdjustBankAngle(4)",
        "",
        "")
    create_command("MobiFlight/B777/BankAngle25",
        "BankAngle25",
        "AdjustBankAngle(5)",
        "",
        "")

    function Adjust738BankAngle(desiredPosition)
        AdjustBankAngle(actualPosition, desiredPosition, '1-sim/command/mcpBankAngleSwitch_switch+', '1-sim/command/mcpBankAngleSwitch_switch-')
    end
end