OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[3], q[1];
z q[7];
cx q[3], q[1];
cx q[6], q[1];
cx q[3], q[0];
