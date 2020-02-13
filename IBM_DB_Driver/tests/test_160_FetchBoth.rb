# 
#  Licensed Materials - Property of IBM
#
#  (c) Copyright IBM Corp. 2007,2008,2009
#

class TestIbmDb < Test::Unit::TestCase

  def test_160_FetchBoth
    assert_expect do
      conn = IBM_DB.connect("DATABASE=#{database};HOSTNAME=#{hostname};PORT=#{port};UID=#{user};PWD=#{password}",'','')

      server = IBM_DB::server_info( conn )
      if (server.DBMS_NAME[0,3] == 'IDS')
        op = {IBM_DB::ATTR_CASE => IBM_DB::CASE_UPPER}
        IBM_DB::set_option conn, op, 0
      end

      result = IBM_DB::exec conn, "select * from emp_act"
      
      while (row = IBM_DB::fetch_both(result))
        printf("%6s  ",row[0])
        printf("%-6s ",row[1])
        printf("%3d ",row[2])
        printf("%9s ",row['EMPTIME'])
        printf("%10s ", row['EMSTDATE'])
        printf("%10s ", row['EMENDATE'])
        printf("%6s ", row[0])
        puts ""
      end
    end
  end

end

__END__
__LUW_EXPECTED__
000010  MA2100  10     0.5e0 1982-01-01 1982-11-01 000010 
000010  MA2110  10     0.1e1 1982-01-01 1983-02-01 000010 
000010  AD3100  10     0.5e0 1982-01-01 1982-07-01 000010 
000020  PL2100  30     0.1e1 1982-01-01 1982-09-15 000020 
000030  IF1000  10     0.5e0 1982-06-01 1983-01-01 000030 
000030  IF2000  10     0.5e0 1982-01-01 1983-01-01 000030 
000050  OP1000  10    0.25e0 1982-01-01 1983-02-01 000050 
000050  OP2010  10    0.75e0 1982-01-01 1983-02-01 000050 
000070  AD3110  10     0.1e1 1982-01-01 1983-02-01 000070 
000090  OP1010  10     0.1e1 1982-01-01 1983-02-01 000090 
000100  OP2010  10     0.1e1 1982-01-01 1983-02-01 000100 
000110  MA2100  20     0.1e1 1982-01-01 1982-03-01 000110 
000130  IF1000  90     0.1e1 1982-01-01 1982-10-01 000130 
000130  IF1000 100     0.5e0 1982-10-01 1983-01-01 000130 
000140  IF1000  90     0.5e0 1982-10-01 1983-01-01 000140 
000140  IF2000 100     0.1e1 1982-01-01 1982-03-01 000140 
000140  IF2000 100     0.5e0 1982-03-01 1982-07-01 000140 
000140  IF2000 110     0.5e0 1982-03-01 1982-07-01 000140 
000140  IF2000 110     0.5e0 1982-10-01 1983-01-01 000140 
000150  MA2112  60     0.1e1 1982-01-01 1982-07-15 000150 
000150  MA2112 180     0.1e1 1982-07-15 1983-02-01 000150 
000160  MA2113  60     0.1e1 1982-07-15 1983-02-01 000160 
000170  MA2112  60     0.1e1 1982-01-01 1983-06-01 000170 
000170  MA2112  70     0.1e1 1982-06-01 1983-02-01 000170 
000170  MA2113  80     0.1e1 1982-01-01 1983-02-01 000170 
000180  MA2113  70     0.1e1 1982-04-01 1982-06-15 000180 
000190  MA2112  70     0.1e1 1982-02-01 1982-10-01 000190 
000190  MA2112  80     0.1e1 1982-10-01 1983-10-01 000190 
000200  MA2111  50     0.1e1 1982-01-01 1982-06-15 000200 
000200  MA2111  60     0.1e1 1982-06-15 1983-02-01 000200 
000210  MA2113  80     0.5e0 1982-10-01 1983-02-01 000210 
000210  MA2113 180     0.5e0 1982-10-01 1983-02-01 000210 
000220  MA2111  40     0.1e1 1982-01-01 1983-02-01 000220 
000230  AD3111  60     0.1e1 1982-01-01 1982-03-15 000230 
000230  AD3111  60     0.5e0 1982-03-15 1982-04-15 000230 
000230  AD3111  70     0.5e0 1982-03-15 1982-10-15 000230 
000230  AD3111  80     0.5e0 1982-04-15 1982-10-15 000230 
000230  AD3111 180     0.1e1 1982-10-15 1983-01-01 000230 
000240  AD3111  70     0.1e1 1982-02-15 1982-09-15 000240 
000240  AD3111  80     0.1e1 1982-09-15 1983-01-01 000240 
000250  AD3112  60     0.1e1 1982-01-01 1982-02-01 000250 
000250  AD3112  60     0.5e0 1982-02-01 1982-03-15 000250 
000250  AD3112  60     0.5e0 1982-12-01 1983-01-01 000250 
000250  AD3112  60     0.1e1 1983-01-01 1983-02-01 000250 
000250  AD3112  70     0.5e0 1982-02-01 1982-03-15 000250 
000250  AD3112  70     0.1e1 1982-03-15 1982-08-15 000250 
000250  AD3112  70    0.25e0 1982-08-15 1982-10-15 000250 
000250  AD3112  80    0.25e0 1982-08-15 1982-10-15 000250 
000250  AD3112  80     0.5e0 1982-10-15 1982-12-01 000250 
000250  AD3112 180     0.5e0 1982-08-15 1983-01-01 000250 
000260  AD3113  70     0.5e0 1982-06-15 1982-07-01 000260 
000260  AD3113  70     0.1e1 1982-07-01 1983-02-01 000260 
000260  AD3113  80     0.1e1 1982-01-01 1982-03-01 000260 
000260  AD3113  80     0.5e0 1982-03-01 1982-04-15 000260 
000260  AD3113 180     0.5e0 1982-03-01 1982-04-15 000260 
000260  AD3113 180     0.1e1 1982-04-15 1982-06-01 000260 
000260  AD3113 180     0.5e0 1982-06-01 1982-07-01 000260 
000270  AD3113  60     0.5e0 1982-03-01 1982-04-01 000270 
000270  AD3113  60     0.1e1 1982-04-01 1982-09-01 000270 
000270  AD3113  60    0.25e0 1982-09-01 1982-10-15 000270 
000270  AD3113  70    0.75e0 1982-09-01 1982-10-15 000270 
000270  AD3113  70     0.1e1 1982-10-15 1983-02-01 000270 
000270  AD3113  80     0.1e1 1982-01-01 1982-03-01 000270 
000270  AD3113  80     0.5e0 1982-03-01 1982-04-01 000270 
000280  OP1010 130     0.1e1 1982-01-01 1983-02-01 000280 
000290  OP1010 130     0.1e1 1982-01-01 1983-02-01 000290 
000300  OP1010 130     0.1e1 1982-01-01 1983-02-01 000300 
000310  OP1010 130     0.1e1 1982-01-01 1983-02-01 000310 
000320  OP2011 140    0.75e0 1982-01-01 1983-02-01 000320 
000320  OP2011 150    0.25e0 1982-01-01 1983-02-01 000320 
000330  OP2012 140    0.25e0 1982-01-01 1983-02-01 000330 
000330  OP2012 160    0.75e0 1982-01-01 1983-02-01 000330 
000340  OP2013 140     0.5e0 1982-01-01 1983-02-01 000340 
000340  OP2013 170     0.5e0 1982-01-01 1983-02-01 000340 
000020  PL2100  30     0.1e1 1982-01-01 1982-09-15 000020
__ZOS_EXPECTED__
000010  MA2100  10     0.5e0 1982-01-01 1982-11-01 000010 
000010  MA2110  10     0.1e1 1982-01-01 1983-02-01 000010 
000010  AD3100  10     0.5e0 1982-01-01 1982-07-01 000010 
000020  PL2100  30     0.1e1 1982-01-01 1982-09-15 000020 
000030  IF1000  10     0.5e0 1982-06-01 1983-01-01 000030 
000030  IF2000  10     0.5e0 1982-01-01 1983-01-01 000030 
000050  OP1000  10    0.25e0 1982-01-01 1983-02-01 000050 
000050  OP2010  10    0.75e0 1982-01-01 1983-02-01 000050 
000070  AD3110  10     0.1e1 1982-01-01 1983-02-01 000070 
000090  OP1010  10     0.1e1 1982-01-01 1983-02-01 000090 
000100  OP2010  10     0.1e1 1982-01-01 1983-02-01 000100 
000110  MA2100  20     0.1e1 1982-01-01 1982-03-01 000110 
000130  IF1000  90     0.1e1 1982-01-01 1982-10-01 000130 
000130  IF1000 100     0.5e0 1982-10-01 1983-01-01 000130 
000140  IF1000  90     0.5e0 1982-10-01 1983-01-01 000140 
000140  IF2000 100     0.1e1 1982-01-01 1982-03-01 000140 
000140  IF2000 100     0.5e0 1982-03-01 1982-07-01 000140 
000140  IF2000 110     0.5e0 1982-03-01 1982-07-01 000140 
000140  IF2000 110     0.5e0 1982-10-01 1983-01-01 000140 
000150  MA2112  60     0.1e1 1982-01-01 1982-07-15 000150 
000150  MA2112 180     0.1e1 1982-07-15 1983-02-01 000150 
000160  MA2113  60     0.1e1 1982-07-15 1983-02-01 000160 
000170  MA2112  60     0.1e1 1982-01-01 1983-06-01 000170 
000170  MA2112  70     0.1e1 1982-06-01 1983-02-01 000170 
000170  MA2113  80     0.1e1 1982-01-01 1983-02-01 000170 
000180  MA2113  70     0.1e1 1982-04-01 1982-06-15 000180 
000190  MA2112  70     0.1e1 1982-02-01 1982-10-01 000190 
000190  MA2112  80     0.1e1 1982-10-01 1983-10-01 000190 
000200  MA2111  50     0.1e1 1982-01-01 1982-06-15 000200 
000200  MA2111  60     0.1e1 1982-06-15 1983-02-01 000200 
000210  MA2113  80     0.5e0 1982-10-01 1983-02-01 000210 
000210  MA2113 180     0.5e0 1982-10-01 1983-02-01 000210 
000220  MA2111  40     0.1e1 1982-01-01 1983-02-01 000220 
000230  AD3111  60     0.1e1 1982-01-01 1982-03-15 000230 
000230  AD3111  60     0.5e0 1982-03-15 1982-04-15 000230 
000230  AD3111  70     0.5e0 1982-03-15 1982-10-15 000230 
000230  AD3111  80     0.5e0 1982-04-15 1982-10-15 000230 
000230  AD3111 180     0.1e1 1982-10-15 1983-01-01 000230 
000240  AD3111  70     0.1e1 1982-02-15 1982-09-15 000240 
000240  AD3111  80     0.1e1 1982-09-15 1983-01-01 000240 
000250  AD3112  60     0.1e1 1982-01-01 1982-02-01 000250 
000250  AD3112  60     0.5e0 1982-02-01 1982-03-15 000250 
000250  AD3112  60     0.5e0 1982-12-01 1983-01-01 000250 
000250  AD3112  60     0.1e1 1983-01-01 1983-02-01 000250 
000250  AD3112  70     0.5e0 1982-02-01 1982-03-15 000250 
000250  AD3112  70     0.1e1 1982-03-15 1982-08-15 000250 
000250  AD3112  70    0.25e0 1982-08-15 1982-10-15 000250 
000250  AD3112  80    0.25e0 1982-08-15 1982-10-15 000250 
000250  AD3112  80     0.5e0 1982-10-15 1982-12-01 000250 
000250  AD3112 180     0.5e0 1982-08-15 1983-01-01 000250 
000260  AD3113  70     0.5e0 1982-06-15 1982-07-01 000260 
000260  AD3113  70     0.1e1 1982-07-01 1983-02-01 000260 
000260  AD3113  80     0.1e1 1982-01-01 1982-03-01 000260 
000260  AD3113  80     0.5e0 1982-03-01 1982-04-15 000260 
000260  AD3113 180     0.5e0 1982-03-01 1982-04-15 000260 
000260  AD3113 180     0.1e1 1982-04-15 1982-06-01 000260 
000260  AD3113 180     0.5e0 1982-06-01 1982-07-01 000260 
000270  AD3113  60     0.5e0 1982-03-01 1982-04-01 000270 
000270  AD3113  60     0.1e1 1982-04-01 1982-09-01 000270 
000270  AD3113  60    0.25e0 1982-09-01 1982-10-15 000270 
000270  AD3113  70    0.75e0 1982-09-01 1982-10-15 000270 
000270  AD3113  70     0.1e1 1982-10-15 1983-02-01 000270 
000270  AD3113  80     0.1e1 1982-01-01 1982-03-01 000270 
000270  AD3113  80     0.5e0 1982-03-01 1982-04-01 000270 
000280  OP1010 130     0.1e1 1982-01-01 1983-02-01 000280 
000290  OP1010 130     0.1e1 1982-01-01 1983-02-01 000290 
000300  OP1010 130     0.1e1 1982-01-01 1983-02-01 000300 
000310  OP1010 130     0.1e1 1982-01-01 1983-02-01 000310 
000320  OP2011 140    0.75e0 1982-01-01 1983-02-01 000320 
000320  OP2011 150    0.25e0 1982-01-01 1983-02-01 000320 
000330  OP2012 140    0.25e0 1982-01-01 1983-02-01 000330 
000330  OP2012 160    0.75e0 1982-01-01 1983-02-01 000330 
000340  OP2013 140     0.5e0 1982-01-01 1983-02-01 000340 
000340  OP2013 170     0.5e0 1982-01-01 1983-02-01 000340 
000020  PL2100  30     0.1e1 1982-01-01 1982-09-15 000020
__SYSTEMI_EXPECTED__
000010  MA2100  10     0.5e0 1982-01-01 1982-11-01 000010 
000010  MA2110  10     0.1e1 1982-01-01 1983-02-01 000010 
000010  AD3100  10     0.5e0 1982-01-01 1982-07-01 000010 
000020  PL2100  30     0.1e1 1982-01-01 1982-09-15 000020 
000030  IF1000  10     0.5e0 1982-06-01 1983-01-01 000030 
000030  IF2000  10     0.5e0 1982-01-01 1983-01-01 000030 
000050  OP1000  10    0.25e0 1982-01-01 1983-02-01 000050 
000050  OP2010  10    0.75e0 1982-01-01 1983-02-01 000050 
000070  AD3110  10     0.1e1 1982-01-01 1983-02-01 000070 
000090  OP1010  10     0.1e1 1982-01-01 1983-02-01 000090 
000100  OP2010  10     0.1e1 1982-01-01 1983-02-01 000100 
000110  MA2100  20     0.1e1 1982-01-01 1982-03-01 000110 
000130  IF1000  90     0.1e1 1982-01-01 1982-10-01 000130 
000130  IF1000 100     0.5e0 1982-10-01 1983-01-01 000130 
000140  IF1000  90     0.5e0 1982-10-01 1983-01-01 000140 
000140  IF2000 100     0.1e1 1982-01-01 1982-03-01 000140 
000140  IF2000 100     0.5e0 1982-03-01 1982-07-01 000140 
000140  IF2000 110     0.5e0 1982-03-01 1982-07-01 000140 
000140  IF2000 110     0.5e0 1982-10-01 1983-01-01 000140 
000150  MA2112  60     0.1e1 1982-01-01 1982-07-15 000150 
000150  MA2112 180     0.1e1 1982-07-15 1983-02-01 000150 
000160  MA2113  60     0.1e1 1982-07-15 1983-02-01 000160 
000170  MA2112  60     0.1e1 1982-01-01 1983-06-01 000170 
000170  MA2112  70     0.1e1 1982-06-01 1983-02-01 000170 
000170  MA2113  80     0.1e1 1982-01-01 1983-02-01 000170 
000180  MA2113  70     0.1e1 1982-04-01 1982-06-15 000180 
000190  MA2112  70     0.1e1 1982-02-01 1982-10-01 000190 
000190  MA2112  80     0.1e1 1982-10-01 1983-10-01 000190 
000200  MA2111  50     0.1e1 1982-01-01 1982-06-15 000200 
000200  MA2111  60     0.1e1 1982-06-15 1983-02-01 000200 
000210  MA2113  80     0.5e0 1982-10-01 1983-02-01 000210 
000210  MA2113 180     0.5e0 1982-10-01 1983-02-01 000210 
000220  MA2111  40     0.1e1 1982-01-01 1983-02-01 000220 
000230  AD3111  60     0.1e1 1982-01-01 1982-03-15 000230 
000230  AD3111  60     0.5e0 1982-03-15 1982-04-15 000230 
000230  AD3111  70     0.5e0 1982-03-15 1982-10-15 000230 
000230  AD3111  80     0.5e0 1982-04-15 1982-10-15 000230 
000230  AD3111 180     0.1e1 1982-10-15 1983-01-01 000230 
000240  AD3111  70     0.1e1 1982-02-15 1982-09-15 000240 
000240  AD3111  80     0.1e1 1982-09-15 1983-01-01 000240 
000250  AD3112  60     0.1e1 1982-01-01 1982-02-01 000250 
000250  AD3112  60     0.5e0 1982-02-01 1982-03-15 000250 
000250  AD3112  60     0.5e0 1982-12-01 1983-01-01 000250 
000250  AD3112  60     0.1e1 1983-01-01 1983-02-01 000250 
000250  AD3112  70     0.5e0 1982-02-01 1982-03-15 000250 
000250  AD3112  70     0.1e1 1982-03-15 1982-08-15 000250 
000250  AD3112  70    0.25e0 1982-08-15 1982-10-15 000250 
000250  AD3112  80    0.25e0 1982-08-15 1982-10-15 000250 
000250  AD3112  80     0.5e0 1982-10-15 1982-12-01 000250 
000250  AD3112 180     0.5e0 1982-08-15 1983-01-01 000250 
000260  AD3113  70     0.5e0 1982-06-15 1982-07-01 000260 
000260  AD3113  70     0.1e1 1982-07-01 1983-02-01 000260 
000260  AD3113  80     0.1e1 1982-01-01 1982-03-01 000260 
000260  AD3113  80     0.5e0 1982-03-01 1982-04-15 000260 
000260  AD3113 180     0.5e0 1982-03-01 1982-04-15 000260 
000260  AD3113 180     0.1e1 1982-04-15 1982-06-01 000260 
000260  AD3113 180     0.5e0 1982-06-01 1982-07-01 000260 
000270  AD3113  60     0.5e0 1982-03-01 1982-04-01 000270 
000270  AD3113  60     0.1e1 1982-04-01 1982-09-01 000270 
000270  AD3113  60    0.25e0 1982-09-01 1982-10-15 000270 
000270  AD3113  70    0.75e0 1982-09-01 1982-10-15 000270 
000270  AD3113  70     0.1e1 1982-10-15 1983-02-01 000270 
000270  AD3113  80     0.1e1 1982-01-01 1982-03-01 000270 
000270  AD3113  80     0.5e0 1982-03-01 1982-04-01 000270 
000280  OP1010 130     0.1e1 1982-01-01 1983-02-01 000280 
000290  OP1010 130     0.1e1 1982-01-01 1983-02-01 000290 
000300  OP1010 130     0.1e1 1982-01-01 1983-02-01 000300 
000310  OP1010 130     0.1e1 1982-01-01 1983-02-01 000310 
000320  OP2011 140    0.75e0 1982-01-01 1983-02-01 000320 
000320  OP2011 150    0.25e0 1982-01-01 1983-02-01 000320 
000330  OP2012 140    0.25e0 1982-01-01 1983-02-01 000330 
000330  OP2012 160    0.75e0 1982-01-01 1983-02-01 000330 
000340  OP2013 140     0.5e0 1982-01-01 1983-02-01 000340 
000340  OP2013 170     0.5e0 1982-01-01 1983-02-01 000340 
000020  PL2100  30     0.1e1 1982-01-01 1982-09-15 000020
__IDS_EXPECTED__
000010  MA2100  10     0.5e0 1982-01-01 1982-11-01 000010 
000010  MA2110  10     0.1e1 1982-01-01 1983-02-01 000010 
000010  AD3100  10     0.5e0 1982-01-01 1982-07-01 000010 
000020  PL2100  30     0.1e1 1982-01-01 1982-09-15 000020 
000030  IF1000  10     0.5e0 1982-06-01 1983-01-01 000030 
000030  IF2000  10     0.5e0 1982-01-01 1983-01-01 000030 
000050  OP1000  10    0.25e0 1982-01-01 1983-02-01 000050 
000050  OP2010  10    0.75e0 1982-01-01 1983-02-01 000050 
000070  AD3110  10     0.1e1 1982-01-01 1983-02-01 000070 
000090  OP1010  10     0.1e1 1982-01-01 1983-02-01 000090 
000100  OP2010  10     0.1e1 1982-01-01 1983-02-01 000100 
000110  MA2100  20     0.1e1 1982-01-01 1982-03-01 000110 
000130  IF1000  90     0.1e1 1982-01-01 1982-10-01 000130 
000130  IF1000 100     0.5e0 1982-10-01 1983-01-01 000130 
000140  IF1000  90     0.5e0 1982-10-01 1983-01-01 000140 
000140  IF2000 100     0.1e1 1982-01-01 1982-03-01 000140 
000140  IF2000 100     0.5e0 1982-03-01 1982-07-01 000140 
000140  IF2000 110     0.5e0 1982-03-01 1982-07-01 000140 
000140  IF2000 110     0.5e0 1982-10-01 1983-01-01 000140 
000150  MA2112  60     0.1e1 1982-01-01 1982-07-15 000150 
000150  MA2112 180     0.1e1 1982-07-15 1983-02-01 000150 
000160  MA2113  60     0.1e1 1982-07-15 1983-02-01 000160 
000170  MA2112  60     0.1e1 1982-01-01 1983-06-01 000170 
000170  MA2112  70     0.1e1 1982-06-01 1983-02-01 000170 
000170  MA2113  80     0.1e1 1982-01-01 1983-02-01 000170 
000180  MA2113  70     0.1e1 1982-04-01 1982-06-15 000180 
000190  MA2112  70     0.1e1 1982-02-01 1982-10-01 000190 
000190  MA2112  80     0.1e1 1982-10-01 1983-10-01 000190 
000200  MA2111  50     0.1e1 1982-01-01 1982-06-15 000200 
000200  MA2111  60     0.1e1 1982-06-15 1983-02-01 000200 
000210  MA2113  80     0.5e0 1982-10-01 1983-02-01 000210 
000210  MA2113 180     0.5e0 1982-10-01 1983-02-01 000210 
000220  MA2111  40     0.1e1 1982-01-01 1983-02-01 000220 
000230  AD3111  60     0.1e1 1982-01-01 1982-03-15 000230 
000230  AD3111  60     0.5e0 1982-03-15 1982-04-15 000230 
000230  AD3111  70     0.5e0 1982-03-15 1982-10-15 000230 
000230  AD3111  80     0.5e0 1982-04-15 1982-10-15 000230 
000230  AD3111 180     0.1e1 1982-10-15 1983-01-01 000230 
000240  AD3111  70     0.1e1 1982-02-15 1982-09-15 000240 
000240  AD3111  80     0.1e1 1982-09-15 1983-01-01 000240 
000250  AD3112  60     0.1e1 1982-01-01 1982-02-01 000250 
000250  AD3112  60     0.5e0 1982-02-01 1982-03-15 000250 
000250  AD3112  60     0.5e0 1982-12-01 1983-01-01 000250 
000250  AD3112  60     0.1e1 1983-01-01 1983-02-01 000250 
000250  AD3112  70     0.5e0 1982-02-01 1982-03-15 000250 
000250  AD3112  70     0.1e1 1982-03-15 1982-08-15 000250 
000250  AD3112  70    0.25e0 1982-08-15 1982-10-15 000250 
000250  AD3112  80    0.25e0 1982-08-15 1982-10-15 000250 
000250  AD3112  80     0.5e0 1982-10-15 1982-12-01 000250 
000250  AD3112 180     0.5e0 1982-08-15 1983-01-01 000250 
000260  AD3113  70     0.5e0 1982-06-15 1982-07-01 000260 
000260  AD3113  70     0.1e1 1982-07-01 1983-02-01 000260 
000260  AD3113  80     0.1e1 1982-01-01 1982-03-01 000260 
000260  AD3113  80     0.5e0 1982-03-01 1982-04-15 000260 
000260  AD3113 180     0.5e0 1982-03-01 1982-04-15 000260 
000260  AD3113 180     0.1e1 1982-04-15 1982-06-01 000260 
000260  AD3113 180     0.5e0 1982-06-01 1982-07-01 000260 
000270  AD3113  60     0.5e0 1982-03-01 1982-04-01 000270 
000270  AD3113  60     0.1e1 1982-04-01 1982-09-01 000270 
000270  AD3113  60    0.25e0 1982-09-01 1982-10-15 000270 
000270  AD3113  70    0.75e0 1982-09-01 1982-10-15 000270 
000270  AD3113  70     0.1e1 1982-10-15 1983-02-01 000270 
000270  AD3113  80     0.1e1 1982-01-01 1982-03-01 000270 
000270  AD3113  80     0.5e0 1982-03-01 1982-04-01 000270 
000280  OP1010 130     0.1e1 1982-01-01 1983-02-01 000280 
000290  OP1010 130     0.1e1 1982-01-01 1983-02-01 000290 
000300  OP1010 130     0.1e1 1982-01-01 1983-02-01 000300 
000310  OP1010 130     0.1e1 1982-01-01 1983-02-01 000310 
000320  OP2011 140    0.75e0 1982-01-01 1983-02-01 000320 
000320  OP2011 150    0.25e0 1982-01-01 1983-02-01 000320 
000330  OP2012 140    0.25e0 1982-01-01 1983-02-01 000330 
000330  OP2012 160    0.75e0 1982-01-01 1983-02-01 000330 
000340  OP2013 140     0.5e0 1982-01-01 1983-02-01 000340 
000340  OP2013 170     0.5e0 1982-01-01 1983-02-01 000340 
000020  PL2100  30     0.1e1 1982-01-01 1982-09-15 000020
