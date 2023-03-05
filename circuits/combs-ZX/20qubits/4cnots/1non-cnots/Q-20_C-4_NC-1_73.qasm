OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[18];
cx q[13], q[7];
z q[19];
cx q[18], q[15];
cx q[15], q[11];
