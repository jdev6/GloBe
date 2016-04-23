function printf(s, ...)
    return print(s:format(...))
end

function print_help(progname)
    printf("Usage: %s [[OPTIONS]] [ROM]", progname)
    print "Available options are:"
    print "  -h, --help       show this help message and quit"
    print "  -v, --version    show version information and quit"

    love.event.quit()
end

function print_version()
    printf("GlöBe %s", GLOBE_VERSION)
    love.event.quit()
end

function arg_parse(args)
    local options = {}
    options.progname = arg[-2]
    local success = false
    for n,arg in pairs(args) do
        if n > 0 then
            --help
            if arg == "-h" or arg == "--help" then
                print_help(options.progname)
                success = true

            --version
            elseif arg == "-v" or arg == "--version" then
                print_version()
                success = true
            
            --unrecognised option
            elseif arg:sub(1,1) == "-" then
                printf("Unrecognised option: %s", arg)

            --rom
            elseif arg ~= "." then
                options.rom = arg
                success = true
            end
        end
    end

    if not success then
        print_help(options.progname)
        love.event.quit(1)
    end
    return options
end

function read_bin(fpath)
    local f = assert(io.open(fpath, "rb"))
    local block = 10
    local t = {}
    while true do
        local bytes = f:read(block)
        if not bytes then break end
        for b in string.gfind(bytes, ".") do
            t[#t+1] = string.byte(b)
        end
    end
    return t
end

function merge_binary_numbers(a,b)
    local bits = select(2,math.frexp(b))
    local result = a
    result = bit.bor(bit.lshift(result, bits), b)
    return result
end

function get_low_nibble(a)
    return bit.band(a, 0x0F)
end

function get_high_nibble(a)
    return bit.band(bit.lshift(a, 4), 0x0F)
end


