# -*- coding: utf-8 -*-
"""
Created on Thu Apr  1 19:40:32 2021

@author: adm
"""

import sqlalchemy as adb
from sqlalchemy import MetaData, Table
import cx_Oracle as ora
import pandas as pd
#import datetime as dt

# Create connection string & engine

l_user = 'Ruchina_NP'
l_pass = 'yfl.if01'
l_tns = ora.makedsn('13.95.167.129', 1521, service_name = 'pdb1')

l_conn_ora = adb.create_engine(r'oracle://{p_user}:{p_pass}@{p_tns}'.format(
    p_user = l_user
    , p_pass = l_pass
    , p_tns = l_tns
    )
    )



print(l_conn_ora)

l_meta = MetaData(l_conn_ora)

l_meta.reflect()


l_res1 = l_meta.tables['ruchina_np_restoran1']



l_file_csv = pd.read_csv(r'C:\Users\Admin\Downloads\archive\restaurant-1-orders.csv')

l_df = l_file_csv.values.tolist()

for i in l_df:
    l_res1.insert([l_res1.c.ordernum
                   , l_res1.c.orderdate
                   , l_res1.c.itemname
                   , l_res1.c.qty
                   , l_res1.c.productprice
                   , l_res1.c.totalprod]).values(
                       ordernum = i[0]
                       , orderdate = i[1].replace('/', '-')
                       , itemname = i[2]
                       , qty = i[3]
                       , productprice = i[4]
                       , totalprod = i[5]
                       ).execute()
    print(1)                  


l_user = 'Ruchina_NP'
l_pass = 'yfl.if01'
l_tns = ora.makedsn('13.95.167.129', 1521, service_name = 'pdb1')

l_conn_ora = adb.create_engine(r'oracle://{p_user}:{p_pass}@{p_tns}'.format(
    p_user = l_user
    , p_pass = l_pass
    , p_tns = l_tns
    )
    )



print(l_conn_ora)

l_meta = MetaData(l_conn_ora)

l_meta.reflect()


l_res1 = l_meta.tables['ruchina_np_restoran2']



l_file_csv = pd.read_csv(r'C:\Users\Admin\Downloads\archive\restaurant-2-orders.csv')

l_df = l_file_csv.values.tolist()

for i in l_df:
    l_res1.insert([l_res1.c.ordernum
                   , l_res1.c.orderdate
                   , l_res1.c.itemname
                   , l_res1.c.qty
                   , l_res1.c.productprice
                   , l_res1.c.totalprod]).values(
                       ordernum = i[0]
                       , orderdate = i[1].replace('/', '-')
                       , itemname = i[2]
                       , qty = i[3]
                       , productprice = i[4]
                       , totalprod = i[5]
                       ).execute()
    print(1)       


