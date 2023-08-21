# Hungry


## setups

- staging api does not seem to return data the same way as prod api, only call staging via postman
- going to need chron job

## info from hooman for params
### account deets
    1. api key
    2. token
### resto / resy
    1. venue_id
    2. date of resy
    3. time of resy
    4. indoor / outdoor

## to_d0
- have returned the find call and gotten all the way to the correct time, but need to return the whole slot details for that time
- don't forget to add time to the config and make sure to do it in 24 hour time frame with secs "21:00:00"

## later goals
- if first doesn't work try +/- 15 minutes

### find call
- get call with all of params 
- returns config_id
   
### detials call 
- get call with all params + config_id returns 
- may need `content-type == url-enconded`??
- returns book token

### book call
- post call with auth params and book token


