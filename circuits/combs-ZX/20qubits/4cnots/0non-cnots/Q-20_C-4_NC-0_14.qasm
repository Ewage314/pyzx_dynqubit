OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[6];
cx q[3], q[0];
cx q[11], q[13];
cx q[0], q[18];
