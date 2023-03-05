OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[1];
cx q[8], q[2];
cx q[4], q[18];
cx q[13], q[0];
