
-- sub select
EXPLAIN QUERY PLAN
SELECT * from posts
    WHERE author_id IN (
        SELECT id from users WHERE name in ('andyvanee', 'johndoe')
    );

-- Joining tables
EXPLAIN QUERY PLAN
SELECT * from posts
    JOIN users ON posts.author_id = users.id
    WHERE users.name IN ('andyvanee', 'johndoe');


-- Nested join
EXPLAIN QUERY PLAN
SELECT
        posts.id,
        parent.id as parent_post_id,
        posts.content,
        posts.created_at,
        posts.author_id,
        users.name as username
    FROM posts
    JOIN users ON posts.author_id = users.id
    LEFT JOIN posts parent ON posts.ref_post_id = parent.id
    WHERE users.name IN ('andyvanee', 'johndoe');

-- Nested join, non-indexed join column
-- EXPLAIN QUERY PLAN
SELECT
        posts.id,
        parent.id as parent_post_id,
        posts.content,
        posts.created_at,
        posts.author_id,
        users.name as username
    FROM posts
    JOIN users ON posts.author_id = users.id
    LEFT JOIN posts parent ON posts.ref_post_id = parent.mirror_id
    WHERE users.name IN ('andyvanee', 'johndoe');

-- Posts with Retweets using non-indexed join column
EXPLAIN QUERY PLAN
SELECT * from posts
    LEFT JOIN posts parent on posts.ref_post_id = parent.mirror_id
    WHERE posts.ref_post_id IN (1);

-- Posts with Retweets using non-indexed sub-select
EXPLAIN QUERY PLAN
SELECT * from posts
    WHERE ref_post_id IN (
        SELECT mirror_id from posts WHERE mirror_id IN (1)
    );
