CREATE TABLE users (
    id serial PRIMARY KEY UNIQUE NOT NULL, 
    firstname varchar(50) NOT NULL, 
    lastname varchar(50) NOT NULL,
    email varchar(100) NOT NULL UNIQUE, 
    pasword text NOT NULL, 
    mobile_phone varchar(20) NOT NULL UNIQUE, 
    address varchar(100) NULL, 
    gender integer NULL, 
    birthdate date NULL, 
    status boolean NOT NULL DEFAULT TRUE, 
    created_at timestamp with time zone NOT NULL DEFAULT NOW(), 
    updated_at timestamp with time zone NOT NULL DEFAULT NOW(), 
    deleted_at timestamp with time zone NULL
);

select * from users;
SELECT 
	u.firstname||''||u.lastname as fullname,
	u.email,
	u.mobile_phone,
	case 
		when u.status = true then 'Active' else 'Inactive' end as status,
	u.profile_photo
from users u;

alter table users add column profile_photo text;
update users set profile_photo='profile_photos/user_def.png';