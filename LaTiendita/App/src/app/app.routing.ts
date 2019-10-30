import { Routes, RouterModule } from '@angular/router';
import { DashboardComponent } from './dashboard/dashboard.component';
import { ProductComponent } from './products/products.component';
import { NgModule } from '@angular/core';
import { ManagementProductComponent } from './products/managementproduct.component';

export const routes: Routes = [
    {
      path: '',
      redirectTo: 'dashboard',
      pathMatch: 'full',
    },
    {
      path: 'dashboard',
      component: DashboardComponent,
      data: {
        title: 'Dashboard'
      }
    },
    {
      path: 'managementproduct',
      component: ManagementProductComponent,
      data: {
        title: 'Products'
      }
    },
    {
      path: 'product',
      component: ProductComponent,
      data: {
        title: 'Products'
      }
    },
    { path: '**', component: DashboardComponent }
];
@NgModule({
    imports: [ RouterModule.forRoot(routes) ],
    exports: [ RouterModule ]
  })
export class AppRoutingModule {}