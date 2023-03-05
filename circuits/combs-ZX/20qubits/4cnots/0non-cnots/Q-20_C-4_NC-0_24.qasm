OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[8];
cx q[7], q[18];
cx q[1], q[6];
cx q[0], q[6];
