namespace s4test;

// Our own test table in HANA - proves the app and its database work,
// independent of the S/4 connection.
entity TestEntries {
    key ID      : Integer;
        name    : String(40);
        comment : String(100);
}
