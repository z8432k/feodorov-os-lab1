BEGIN {
    print "{";
    a = 0
} {

if (NR > 29 && NR < 51) {
    {
        if (a > 0) {
            printf ",\n";
        }

        printf "\t\"%s\": {\n", $3;

        printf "\t\t\"timestamp\": %s,\n", $4;
        printf "\t\t\"client ip\": \"%s\",\n", $5;
        printf "\t\t\"client port\": %s\n", $6;

        printf "%s", "\t}";

        a += 1;
    }
}

} END {
    printf "\n}\n";
}
