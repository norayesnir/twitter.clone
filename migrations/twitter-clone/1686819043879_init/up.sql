SET check_function_bodies = false;
CREATE FUNCTION public.set_current_timestamp_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$;
CREATE TABLE public.gif (
    url text NOT NULL
);
CREATE TABLE public.media (
    url text NOT NULL
);
CREATE TABLE public.tweet (
    id uuid NOT NULL,
    audience text DEFAULT 'everyone'::text NOT NULL,
    value text NOT NULL,
    reply_restriction text DEFAULT 'anyone'::text NOT NULL
);
CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    bio text,
    profession text,
    location text,
    website text,
    joined_date timestamp with time zone,
    birthday_date time with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
ALTER TABLE ONLY public.gif
    ADD CONSTRAINT gif_pkey PRIMARY KEY (url);
ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (url);
ALTER TABLE ONLY public.tweet
    ADD CONSTRAINT tweet_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
CREATE TRIGGER set_public_user_updated_at BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_user_updated_at ON public.users IS 'trigger to set value of column "updated_at" to current timestamp on row update';
