using { riskmanagement as o } from '../db/schema';

 @path: 'service/order'
 service OrderService {
 entity Orders as projection on o.Orders;
     annotate Orders with @odata.draft.enabled;
 entity Items as projection on o.Items;
     annotate Items with @odata.draft.enabled;
 entity Products as projection on o.Products;
     annotate Products with @odata.draft.enabled;
 entity Customers as projection on o.Customers;
     annotate Customers with @odata.draft.enabled;
 //@readonly entity BusinessPartners as projection on rm.BusinessPartners;
 }