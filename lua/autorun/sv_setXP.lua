concommand.Add( "contracts_setXP", function( ply, cmd, args )
    ply:SetNWInt("XP", args[1])
    print( "Your XP was set too".. args[1] )
end )
