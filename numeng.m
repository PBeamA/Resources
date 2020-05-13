function str = numeng(num)

if num >= 10
    str = numsep(num);
else
    switch num
        case 0
            str = 'zero';
        case 1
            str = 'one';
        case 2
            str = 'two';
        case 3
            str = 'three';
        case 4
            str = 'four';
        case 5
            str = 'five';
        case 6
            str = 'six';
        case 7
            str = 'seven';
        case 8
            str = 'eight';
        case 9
            str = 'nine';
            %         case 10
            %             str = 'ten';
    end
end
end