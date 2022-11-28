namespace riskmanagement;
 using { managed } from '@sap/cds/common';

 entity Risks : managed {
 key ID : UUID @(Core.Computed : true);
 title : String(100);
 owner : String;
 prio : String(5);
 descr : String;
 miti : Association to Mitigations;
 impact : Integer;
 bp : Association to BusinessPartners;
 // You will need this definition in a later step
 criticality : Integer;
 }

 entity Mitigations : managed {
 key ID : UUID @(Core.Computed : true);
 descr : String;
 owner : String;
 timeline : String;
 risks : Association to many Risks on risks.miti = $self;
 };

 entity Orders : managed {
    key ID: UUID @(Core.Computed : true);
    customer: Association to Customers;
    Items: Association to many Items on Items.order=$self;
 }
 entity Items : managed {
    key ID: UUID @(Core.Computed : true);
    Product: Association to Products;
    amount: Integer;
    order : Association to Orders;
  }
 entity Products : managed {
    Key ID : UUID @(Core.Computed:true);
    Name: String;
 }
 entity Customers : managed {
   key ID : UUID @(Core.Computed : true);
   Firstname : String;
   Lastname : String;
 }
 
// using an external service from S/4
using { API_BUSINESS_PARTNER as external } from '../srv/external/API_BUSINESS_PARTNER.csn';

entity BusinessPartners as projection on external.A_BusinessPartner {
   key BusinessPartner,
   LastName, 
   FirstName 
} 
