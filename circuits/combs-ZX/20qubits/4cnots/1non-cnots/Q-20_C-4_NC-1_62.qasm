OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[18];
cx q[10], q[15];
x q[8];
cx q[14], q[13];
cx q[9], q[15];
