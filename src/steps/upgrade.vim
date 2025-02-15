if exists(":NeoBundleUpdate")
    echo "NeoBundle"
    NeoBundleUpdate
endif

if exists(":PluginUpdate")
    echo "Plugin"
    PluginUpdate
endif

if exists(":PlugUpgrade")
    echo "Plug"
    PlugUpgrade
    if $TOPGRADE_FORCE_PLUGUPDATE
        PlugUpdate!
    else
        PlugUpdate
    endif
endif

if exists("*dein#update()")
    echo "dein#update()"
    call dein#update()
endif

if exists(":DeinUpdate")
    echo "DeinUpdate"
    DeinUpdate
endif

if exists(":PaqUpdate")
    echo "PaqUpdate"
    PaqUpdate
endif

if exists(":Lazy")
    echo "Lazy Update"
    +Lazy! sync
endif

function! UpdateCoCAndTS()
    if exists(":CocUpdateSync")
        echo "CocUpdateSync"
        CocUpdateSync
    endif

    if exists(":TSUpdateSync")
        echo "TreeSitter Update"
        TSUpdate
    endif

    quitall
endfunction

if exists(':PackerSync')
    echo "Packer"
    autocmd User PackerComplete * call UpdateCoCAndTS()
    PackerSync
else
    call UpdateCoCAndTS()
endif
