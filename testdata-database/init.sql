CREATE TABLE IF NOT EXISTS players (
                                       id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                       name text NOT NULL,
                                       rating real NOT NULL,
                                       icon integer NOT NULL,
                                       races_count integer NOT NULL DEFAULT 0,
                                       season integer NOT NULL DEFAULT 1
);


CREATE TABLE IF NOT EXISTS races (
                                     id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                     ranking integer[] NOT NULL,
                                     date timestamp without time zone NOT NULL,
                                     season integer NOT NULL DEFAULT 1
);


CREATE TABLE IF NOT EXISTS players_races (
                                             id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                             user_id integer NOT NULL REFERENCES players(id) ON DELETE CASCADE ON UPDATE CASCADE,
    race_id integer NOT NULL REFERENCES races(id) ON DELETE CASCADE ON UPDATE CASCADE,
    old_rating real NOT NULL DEFAULT 1000,
    new_rating real NOT NULL DEFAULT 1000,
    rating_diff real NOT NULL DEFAULT 0
    );

CREATE TABLE IF NOT EXISTS metadata (
                                        key text PRIMARY KEY,
                                        value text NOT NULL,
                                        updated_at timestamp without time zone NOT NULL DEFAULT now()
    );

INSERT INTO metadata (key, value) values('version', 'v1');
ALTER TABLE "public"."players" ADD COLUMN "transfered" bool NOT NULL DEFAULT 'false';
UPDATE metadata SET value = 'v2', updated_at = NOW() WHERE key = 'version';