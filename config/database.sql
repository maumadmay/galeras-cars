/*CREATE TABLE users (
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
*/


-- 1. Crear tabla USERS (Tu versión con la columna 'role' agregada)
CREATE TABLE users (
    id SERIAL PRIMARY KEY UNIQUE NOT NULL, 
    firstname VARCHAR(50) NOT NULL, 
    lastname VARCHAR(50) NOT NULL, 
    email VARCHAR(100) NOT NULL UNIQUE, 
    password TEXT NOT NULL, 
    mobile_phone VARCHAR(20) NOT NULL UNIQUE, 
    address VARCHAR(100) NULL, 
    gender INTEGER NULL, 
    birthdate DATE NULL, 
    status BOOLEAN NOT NULL DEFAULT TRUE,
    role VARCHAR(50) NOT NULL DEFAULT 'user', -- Columna agregada
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(), 
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(), 
    deleted_at TIMESTAMP NULL
);

-- 2. Crear tabla BRANDS (Marcas)
CREATE TABLE brands (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(), 
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(), 
    deleted_at TIMESTAMP NULL
);

-- 3. Crear tabla CUSTOMERS (Clientes)
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(), 
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(), 
    deleted_at TIMESTAMP NULL
);

-- 4. Crear tabla VEHICLES (Vehículos)
CREATE TABLE vehicles (
    id SERIAL PRIMARY KEY,
    brand_id INTEGER NOT NULL,
    model VARCHAR(100) NOT NULL,
    year INTEGER NOT NULL,
    price DECIMAL(12, 2) NOT NULL,
    stock INTEGER NOT NULL,
    color VARCHAR(30),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(), 
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(), 
    deleted_at TIMESTAMP NULL,
    CONSTRAINT fk_vehicles_brands FOREIGN KEY (brand_id) REFERENCES brands(id)
);

-- 5. Crear tabla SALES (Ventas)
CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    vehicle_id INTEGER NOT NULL,
    sale_date DATE NOT NULL,
    total_amount DECIMAL(12, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(), 
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(), 
    deleted_at TIMESTAMP NULL,
    CONSTRAINT fk_sales_users FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_sales_vehicles FOREIGN KEY (vehicle_id) REFERENCES vehicles(id)
);

-- 6. Crear tabla PAYMENTS (Pagos)
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    sale_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    amount DECIMAL(12, 2) NOT NULL,
    payment_date DATE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(), 
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(), 
    deleted_at TIMESTAMP NULL,
    CONSTRAINT fk_payments_sales FOREIGN KEY (sale_id) REFERENCES sales(id),
    CONSTRAINT fk_payments_customers FOREIGN KEY (customer_id) REFERENCES customers(id)
);