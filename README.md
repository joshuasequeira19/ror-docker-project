Postgres and Redis use Docker volumes to manage persistence
Postgres, Redis and Drkiq all expose a port
Drkiq and Sidekiq both have links to Postgres and Redis.
Drkiq and Sidekiq both read in environment variables from .env
Sidekiq overwrites the default CMD to run Sidekiq instead of Unicorn.

Notes

The Redis client for Ruby was recently updated and now checks command argument types strictly. Sidekiq as of 6.4.2 was passing a boolean (in your case FalseClass) in the heartbeat code, which the new Redis client rejected, hence the error. Booleans are invalid because Redis hashes don't support type hints; Redis 4.6 and older would just quietly convert to string.

Sidekiq has been updated to work with the new Redis client as of 6.5.x. I'm using 6.5.5 and the error is gone:

ssh ```
  gem 'sidekiq', '~> 6.5.5'
```
