-- Test 1: duplicate email (should be rejected)
DO $$
BEGIN
    INSERT INTO riders (FullName, email, password, phonenumber)
    VALUES ('Test', 'ahmed@example.com', 'x', '01099999991');
    RAISE NOTICE 'FAIL: duplicate email accepted';
EXCEPTION WHEN unique_violation THEN
    RAISE NOTICE 'PASS: duplicate email rejected';
END $$;

-- Test 2: duplicate phone (should be rejected)
DO $$
BEGIN
    INSERT INTO riders (FullName, email, password, phonenumber)
    VALUES ('Test', 'new1@example.com', 'x', '01012345678');
    RAISE NOTICE 'FAIL: duplicate phone accepted';
EXCEPTION WHEN unique_violation THEN
    RAISE NOTICE 'PASS: duplicate phone rejected';
END $$;

-- Test 3: invalid phone (should be rejected)
DO $$
BEGIN
    INSERT INTO riders (FullName, email, password, phonenumber)
    VALUES ('Test', 'new2@example.com', 'x', '123');
    RAISE NOTICE 'FAIL: invalid phone accepted';
EXCEPTION WHEN check_violation THEN
    RAISE NOTICE 'PASS: invalid phone rejected';
END $$;

-- Test 4: missing name (should be rejected)
DO $$
BEGIN
    INSERT INTO riders (FullName, email, password, phonenumber)
    VALUES (NULL, 'new3@example.com', 'x', '01099999993');
    RAISE NOTICE 'FAIL: NULL name accepted';
EXCEPTION WHEN not_null_violation THEN
    RAISE NOTICE 'PASS: NULL name rejected';
END $$;